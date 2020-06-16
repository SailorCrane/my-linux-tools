#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os

from paramiko import SSHClient
from scp import SCPClient
import utils


class ScpException(Exception) :
    pass


class UploadSshPubKey:
    def __init__(self, host, port, username, password, ssh_pub_key=None):
        # init data
        self.hostname, self.port = host, int(port)
        self.username, self.password = username, password
        self.ssh, self.scp = self.get_ssh_scp()
        self.tmp_push_path = '/tmp/tmp_push_key.txt'
        self.ssh_pub_key = self.get_pub_key_path(ssh_pub_key)

        # process
        self._push()
        if not self._is_exist():
            print('The remote has no this pub key, will be pushed soon!')
            self._append_pub_key()
        else:
            print('The key does exist alreay!')

        self.ssh.close()

    def _push(self):
        self.scp.put(self.ssh_pub_key, self.tmp_push_path)

    def _is_exist(self):
        # =================== cut pub key content =====================
        cut_cmd = "cut %s -d ' ' -f 2" % self.tmp_push_path
        stdin, stdout, stderr = self.ssh.exec_command(cut_cmd)
        search_content = stdout.read().decode('utf-8').strip()      # 去掉换行符'\n'
        err = stderr.read().decode('utf-8')
        if err:
            raise ScpException(err)

        # =================== search pub key content =====================
        cmd = "env grep %s %s" % (search_content, self.ssh_keys_path)
        stdin, stdout, stderr = self.ssh.exec_command(cmd )
        out = stdout.read()
        return bool(out)

    def _append_pub_key(self):
        # cat追加不用判断文件是否存在(只要dir存在即可)
        cmd = 'cat %s >> %s'
        stdin, stdout, stderr = self.ssh.exec_command(cmd % (self.tmp_push_path, self.ssh_keys_path))

        err = stderr.read().decode('utf-8')
        if err:
            raise ScpException(err)

    def _clear_tmp_push(self):
        # 3:remote upload file
        cmd = 'rm -f %s'
        stdin, stdout, stderr = self.ssh.exec_command(cmd % (self.tmp_push_path))
        err = stderr.read().decode('utf-8')
        if err:
            raise ScpException(err)

    @property
    def ssh_keys_path(self):
        if self.username == 'root':
            dir = '/root/'
        else:
            dir = '/home/' + self.username + '/'

        return dir + '.ssh/authorized_keys'

    def get_pub_key_path(self, ssh_pub_key):
        if ssh_pub_key:
            return ssh_pub_key
        else:
            home = os.getenv("HOME")
            return home + "/.ssh/id_rsa.pub"

    def get_ssh_scp(self):
        ssh = SSHClient()
        ssh.load_system_host_keys()
        ssh.connect(self.hostname, self.port, self.username, self.password)

        scp = SCPClient(ssh.get_transport())
        return ssh, scp


def main():
    usage = 'usage: ssh_key_push <host_ip> <port> <username> <password> [public_key_file]'
    if not utils.param_need(sys.argv, 4, usage):
        return

    upload_pub = UploadSshPubKey(*sys.argv[1:])

if __name__ == "__main__":
    exit(main())

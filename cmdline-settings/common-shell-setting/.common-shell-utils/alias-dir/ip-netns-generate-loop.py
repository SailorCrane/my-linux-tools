#!/bin/env python3

ns_num = 4

bin_bang = "#!/bin/bash"
ip_pre = "192.168.11."

del_ns   = "sudo ip netns del myn%s"
add_ns   = "sudo ip netns add myn%s"

veth_gen = "sudo ip link add %s type veth peer name %s"
veth_set = "sudo ip link set %s netns myn%s"
veth_up  = "sudo ip netns exec myn%s ifconfig %s up"

br_gen   = "sudo ip netns exec myn%s brctl addbr br%s"
br_set   = "sudo ip netns exec myn%s brctl addif br%s %s"
br_ip    = "sudo ip netns exec myn%s ifconfig br%s " + ip_pre + "%s"



def num(n):
    # ret_n = (n-1) % ns_num + 1
    ret_n = n % ns_num
    return str(ret_n)

def pair_cur_next(i):
    pa = 'veth' + num(i) + num(i+1) + "-"
    pa1 = pa + num(i)
    pa2 = pa + num(i+1)
    return pa1, pa2

def main():
    print(bin_bang)
    for i in range(0, ns_num):
        print(del_ns % i)

    print()
    for i in range(0, ns_num):
        print(add_ns % i)

    print("\n#veth add and set")
    for i in range(0, ns_num):
        pa1, pa2 = pair_cur_next(i)
        print(veth_gen % (pa1, pa2))
        print(veth_set % (pa1, num(i)))
        print(veth_set % (pa2, num(i+1)))

        # 或者设置ifconfig ethxxx 0.0.0.0
        print(veth_up % (num(i), pa1))
        print(veth_up % (num(i+1), pa2))

        print()


    print("#bridge add and set")
    for i in range(0, ns_num):
        print(br_gen % (i, i))

        pa_cur_left = pair_cur_next(i-1)[1]
        pa_cur_right = pair_cur_next(i)[0]
        print(br_set % (i, i, pa_cur_left))
        print(br_set % (i, i, pa_cur_right))

        print(br_ip % (i, i, i+1))

        print()

main()

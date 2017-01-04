
# 再帰でyield使うパターン
def recur_test():
    def recur(array,residual,index):
        if index==len(array)-1:
            array[index]=residual
            yield array
            return

        for i in xrange(0,residual+1):
            temp_array=[x for x in array]
            temp_array[index]=i
            for j in recur(temp_array,residual-i,index+1):
                yield j


    for elem in recur([0,0,0],4,0):
        print elem
    print "next"
    gen=recur([0,0,0],4,0)
    print gen.next()
    print gen.next()
    print gen.next()
            
        
recur_test()

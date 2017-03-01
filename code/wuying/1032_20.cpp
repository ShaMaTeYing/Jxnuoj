#include <cstdio>
#include <cstring>

int mod(int x){
    return x%20123;
}

int Sumls(char *str,int version)
{
    int length=strlen(str),curPos=length-1,power=0,iFactor=1;
    int iCount=0;
    while(curPos>=0)
    {
        int iLowerNum=0,iCurNum=0,iHigherNum=0;
        for(int i=curPos+1;i<length;i++){
            iLowerNum=mod(mod(iLowerNum*10)+str[i]-'0');
        }
        iCurNum=str[curPos]-'0';
        for(int i=0;i<curPos;i++){
            iHigherNum=mod(mod(iHigherNum*10)+str[i]-'0');
        }
        if(iCurNum<version){
            iCount=mod(iCount+iHigherNum*iFactor);
        }
        else if(iCurNum==version){
            iCount=mod(iCount+iHigherNum*iFactor+iLowerNum+1);
        }
        else{
            iHigherNum++;
            iCount=mod(iCount+iHigherNum*iFactor);
        }
        --curPos;
        iFactor=mod(iFactor*10);
    }
    return iCount;
}

int main()
{
    char str[103];
    while(~scanf("%s",str)){
        int res1=Sumls(str,1);
        int res2=Sumls(str,2);
        int res=res1+res2;
        printf("%d\n",mod(res));
    }
    return 0;
}

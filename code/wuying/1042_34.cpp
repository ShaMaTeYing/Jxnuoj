#include<iostream>
using namespace std;
int  fac[] = {1,1,2,6,24,120,720,5040,40320,362880,3628800,39916800}; //i的阶乘为fac[i]
/*  康托展开的逆运算.
    {1...n}的全排列，中的第k个数为s[]  */
void invKT(int n, int k,int s[])
{
    int i, j, t, sum,vis[20]={0};
    for (i=0; i<n; i++)
    {
        t = k/fac[n-i-1];
        for(int j=1;j<=n;j++)
        {
            if(!vis[j])
            {
                if(t==0)
                {
                    s[i]=j;
                    vis[j]=1;
                    break;
                }
                t--;
            }
        }
        k%=fac[n-1-i];
    }
}
int main()
{
    int s[]={0,1,2,3,4,5,6,7,8,9};
    int n;
    while(cin>>n)
    {
        n--;
        invKT(10,n,s);
        for(int i=0;i<10;i++) cout<<s[i]-1;cout<<endl;
    }

    return 0;
}

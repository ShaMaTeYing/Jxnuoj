#include<iostream>
using namespace std;
int x=0,n,sum=0;
int num(int List[],int i,int j)
{
    int number=0;
    for(int k=i;k<=j;k++)
    {
        number=number*10+List[k];
    }
    return number;
}
void perm(int List[],int k,int m)
{
    if(k==m)
    {
        int a,b,c,blast;
        for(int i=0;i<x;i++)
        {
            a=num(List,0,i);
            blast=(n-a)*List[8]%10;
            for(int j=(9-i)/2+i;j<8;j++)
            {
                if(blast==List[j])
                {
                    b=num(List,i+1,j);
                    c=num(List,j+1,8);
                    if(b%c==0 && n==a+b/c)
                    {
                        //cout<<a<<" "<<b<<" "<<c<<endl;
                        sum++;
                    }
                }
            }
        }
    }
    else
    {
        for(int j=k;j<=m;j++)
        {
            swap(List[k],List[j]);
            perm(List,k+1,m);
            swap(List[k],List[j]);
        }
    }
}
int main()
{
    int m;
    int List[]={1,2,3,4,5,6,7,8,9};
    cin>>n;
    m=n;
    while(m)
    {
        x++;
        m/=10;
    }
    perm(List,0,8);
    cout<<sum<<endl;
    return 0;
}

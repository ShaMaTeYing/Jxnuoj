#include<iostream>
using namespace std;
const int maxn=1005;
int a[maxn],n;
int main()
{
    cin>>n;
    for(int i=0;i<n;i++) cin>>a[i];
    int sum=-1,Max=-9999999,MaxLen=0,Len;
    for(int i=0;i<n;i++)
    {
        if(sum<0) sum=a[i],Len=1;
        else sum+=a[i],Len++;
        if(Max<sum) Max=sum,MaxLen=Len;
        else if(Max==sum&&MaxLen<Len) MaxLen=Len;
    }
    cout<<Max<<" "<<MaxLen<<endl;
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,cnt=0;
    cin>>n;
    for(int i=1;i*i<=n;i++)
        if(n%i==0)
            if(i*i!=n) cnt+=2;
            else cnt+=1;
    cout<<cnt<<endl;
    return 0;
}

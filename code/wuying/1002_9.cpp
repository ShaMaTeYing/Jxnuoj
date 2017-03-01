#include<cstdio>
#include<algorithm>
#include<cmath>
#include<cstring>
#include<iostream>
using namespace std;
const int L=1000005,inf=1<<30,maxn=1000005;
long long a[maxn];
int main()
{
    int n;
    while(cin>>n)
    {
        if(n==0) continue;
        for(int i=0;i<n;i++) cin>>a[i];
        for(int i=n-1;i>0;i--) cout<<a[i]<<" ";cout<<a[0]<<endl;
    }
    return 0;
}


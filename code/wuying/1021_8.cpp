#include<iostream>
#include<cstdio>
#include<algorithm>
using namespace std;
const int maxn=100005;
int a[maxn];
inline bool scan_d(int &num)
{
        char in;bool IsN=false;
        in=getchar();
        if(in==EOF) return false;
        while(in!='-'&&(in<'0'||in>'9')) in=getchar();
        if(in=='-'){ IsN=true;num=0;}
        else num=in-'0';
        while(in=getchar(),in>='0'&&in<='9'){
                num*=10,num+=in-'0';
        }
        if(IsN) num=-num;
        return true;
}
bool Bin(int l,int r,int x)
{
    while(l<=r)
    {
        int m=(l+r)>>1;
        if(x<a[m]) r=m-1;
        else if(x==a[m]) return true;
        else l=m+1;
    }
    return false;
}
int main()
{
    int n,m;
    scan_d(n);
    for(int i=0;i<n;i++) scan_d(a[i]);
    sort(a,a+n);
    scan_d(m);
    while(m--)
    {
        int x;
        scan_d(x);
        if(x>a[n-1]) puts("No");
        else
        {
            if(Bin(0,n-1,x)) puts("Yes");
            else puts("No");
        }
    }
    return 0;
}

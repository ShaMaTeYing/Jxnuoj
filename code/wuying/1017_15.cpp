#include<iostream>
#include<algorithm>
using namespace std;
const int maxn=1000005;
int n;
int a[maxn];
int main()
{
    cin>>n;
    for(int i=0;i<n;i++) cin>>a[i];
    sort(a,a+n);
    for(int i=n;i>=0;i--)
    {
        int cnt=upper_bound(a,a+n,i)-a;
        cnt=n-cnt;
        if(cnt>=i)
        {
            cout<<i<<endl;
            break;
        }
        //cout<<cnt<<endl;
    }

    return 0;
}

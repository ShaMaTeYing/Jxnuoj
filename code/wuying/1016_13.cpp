#include<iostream>
#include<algorithm>
using namespace std;
struct node
{
    int val,cnt;
}a[30];
bool cmp(node a,node b)
{
    return a.val<b.val;
}
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        int n;
        cin>>n;
        for(int i=0;i<n;i++) cin>>a[i].val>>a[i].cnt;
        sort(a,a+n,cmp);
        int w=1;
        long long ans=0;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<a[i].cnt;j++)
                if(a[i].val>=0) ans+=w*a[i].val,w++;
        }
        cout<<ans<<endl;
    }
    return 0;
}

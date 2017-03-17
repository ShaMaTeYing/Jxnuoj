#include<iostream>
#include<algorithm>
using namespace std;
const int maxn=105;
int n,m,a[maxn][maxn],b[maxn],Max=-(1<<30);
int main()
{
    cin>>n>>m;
    for(int i=0;i<n;i++)
        for(int j=0;j<m;j++)
        cin>>a[i][j];
    for(int i=0;i<n;i++)
    {
        fill(b,b+maxn,0);
        for(int j=i;j<n;j++)
        {
            int sum=-1;
            for(int k=0;k<m;k++)
            {
                b[k]+=a[j][k];
                if(sum<0) sum=b[k];
                else sum+=b[k];
                if(Max<sum) Max=sum;
            }
        }
    }
    cout<<Max<<endl;
    return 0;
}

#include<iostream>
using namespace std;
int a1[105][105],a2[105][105];
int n1,m1,n2,m2;
void input(int &n,int &m,int a[105][105])
{
    cin>>n>>m;
    for(int i=1;i<=n;i++)
        for(int j=1;j<=m;j++)
        cin>>a[i][j];
}
bool judge(int x1,int y1)
{
    for(int i=0;i<=n2-1;i++)
        for(int j=0;j<=m2-1;j++)
        if(a1[x1+i][y1+j]!=a2[i+1][j+1]) return 0;
    return 1;

}
void output(int n,int m,int a[105][105])
{
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=m;j++) cout<<a[i][j]<<" ";
        cout<<endl;
    }
}
int main()
{

    input(n1,m1,a1);
    input(n2,m2,a2);
    //output(n1,m1,a1);
    //output(n2,m2,a2);
    int f=1;
    for(int i=1;i<=n1-n2+1;i++)
        for(int j=1;j<=m1-m2+1;j++)
        if(judge(i,j)) f=0,cout<<i<<" "<<j<<endl;
    if(f) cout<<"There is no answer"<<endl;
    return 0;
}

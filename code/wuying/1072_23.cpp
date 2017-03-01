#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int n;
    double ans=0.0;
    cin>>n;
    for(int i=1;i<=n;i++)   ans+=log10(i);
    cout<<(int)ans+1<<endl;
    return 0;
}

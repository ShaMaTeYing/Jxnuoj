#include<iostream>
using namespace std;
int main()
{
    string s;
    long long s1=0,s2=0,s3=0,mod=1000000007;
    cin>>s;
    for(int i=0;i<s.size();i++)
    	if(s[i]=='N') s1=(s1+1)%mod;
        else if(s[i]=='O') s2=(s2+s1)%mod;
        else s3=(s3+s2)%mod;
    cout<<mod<<endl;
	return 0;
}

#include<iostream>
#include<stack>
#include<fstream>
#define LL long long
using namespace std;
LL quick_mod(LL a,LL n,LL p)//����a^b%p
{
    LL ans=1;
    while(n)
    {
        if(n&1) ans=ans*a%p;
        n>>=1;
        a=a*a%p;
    }
    return ans;
}
LL StringToLL(string s)
{
    LL ans=0;
    for(int i=0;i<s.size();i++) ans=ans*10+s[i]-'0';
    return ans;
}
void print(LL n,LL a)
{

}
int main()
{
    int t;
    string s;
    LL x,y,a,p;
    ifstream Cin("in.txt");
    ofstream out("out.txt");
    Cin>>t;
    while(t--)
   {
       Cin>>s>>y>>a;
        if(s.size()<=a) x=StringToLL(s);
        else x=StringToLL(s.substr(s.size()-a));
        LL p=1;
        for(int i=1;i<=a;i++) p*=10;
        stack<LL>s;
        LL n=quick_mod(x,y,p);
        while(n) s.push(n%10),n/=10;
        for(int i=0;i<a-s.size();i++) out<<"0";
        while(s.size()) out<<s.top(),s.pop();
        out<<endl;
   }
    return 0;
}
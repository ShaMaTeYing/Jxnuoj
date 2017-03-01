#include<iostream>
#include<string>
#include<cstdio>
#include<cmath>
#include<sstream>
using namespace std;
int main()
{
    char op;
    string s;
    while(cin>>s)
    {
        int pp=0,ff=0;
        for(int i=0;i<s.size();i++)
            if(s[i]=='=') pp=i+1;
        for(int i=0;i<s.size()-1;i++)
            if(s[i]=='+'&&s[i+1]=='-') ff=1;
        int num=0;
        for(int i=pp;i<s.size();i++) num=num*10+s[i]-'0';
        if(num||ff)
        {
            cout<<"Input error!"<<endl;
            continue;
        }
       // if(!(s[s.size()-1]=='0'&&s[s.size()-2]=='=')) cout<<"Input error!"<<endl;
       // else
        {
            //a*x^2+b*x+c=0
            //a   2 b   c 0
            for(int i=0;i<s.size();i++)
                if('a'<=s[i]&&s[i]<='z') op=s[i],s[i]=' ';
                else if('A'<=s[i]&&s[i]<='Z') op=s[i],s[i]=' ';
                else if(s[i]=='*'||s[i]=='^'||s[i]=='+') s[i]=' ';
            double a[10];
            istringstream is(s);
            int p=0,f=0;
            while(is>>a[p])
            {
               // if(a[p]<0&&p) f=1;
                //cout<<"p = "<<p<<"  a[p] = "<<a[p]<<" ";
                p++;
            }
              //cout<<"p = "<<p<<endl;
           // cout<<endl;
          //  if(f)
            {
             //   cout<<"Input error!"<<endl;
              //  continue;
            }
            //for(int i=0;i<p;i++) cout<<a[i]<<" ";

            if(fabs(a[0])<1e-5 ) cout<<"Input error!"<<endl;
            else
            {
                double deta=a[2]*a[2]-4*a[0]*a[3];
                if(deta<0)
                {
                    double b=-a[2]/(2*a[0]),c=sqrt(-deta)/(2*a[0]);
                    printf("%c1=%.6lf+%.6lf*i\n",op,b,c);
                    printf("%c2=%.6lf-%.6lf*i\n",op,b,c);
                }
                else if(fabs(deta)<1e-5)
                {
                    printf("%c=%.6lf\n",op,-a[2]/(2*a[0]));
                }
                else
                {
                    double b=-a[2]/(2*a[0]),c=sqrt(deta)/(2*a[0]);
                    printf("%c1=%.6lf\n",op,b+c);
                    printf("%c2=%.6lf\n",op,b-c);
                }

            }


        }
    }
    return 0;
}

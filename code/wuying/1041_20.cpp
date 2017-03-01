#include<cstdio>
#include<cstring>
#include<cmath>
#include<cstdlib>
#include<ctime>
#include<iostream>
#include<algorithm>
#include<sstream>
#include<fstream>
#include<vector>
#include<map>
#include<stack>
#include<list>
#include<set>
#include<queue>
#define LL long long
#define lson l,m,rt<<1
#define rson m+1,r,rt<<1 | 1
/*
正反循环的宏定义
*/
#define ffr(i,x,y) for(int i=(x),_en=(y);i<=_en;i++)
#define rff(i,x,y) for(int i=(x),_en=(y);i>=_en;i--)
#define clr(f,z) memset(f,z,sizeof(f))
using namespace std;
const int maxn=100005,inf=1<<29;
int dir[][2]={ {0,1},{-1,0},{0,-1},{1,0},{-1,1},{-1,-1},{1,-1},{1,1}};//常用方向数组

int a[maxn];
struct node
{
    int x,y;
};//常用结构体
vector<int>G[maxn];//常用邻接表
/*
函数重载，可根据参数类型，自动选择输入
*/
bool sf(int &x) { return scanf("%d",&x)==1;}
bool sf(char *x){return scanf("%s",x)==1;}
bool sf(double &x){return scanf("%lf",&x)==1;}
bool sf(LL &x) { return scanf("%lld",&x)==1;}
void pf(int x,int op) {
    op?printf("%d\n",x):printf("%d ",x);//op==0打印数字加空格，op==1打印数字加换行
}
void pf(LL x,int op) {
    op?printf("%lld\n",x):printf("%lld ",x);//op==0打印数字加空格，op==1打印数字加换行
}
int get_rand(int n)
{
    return (int)((double)rand() / RAND_MAX * n) ;
}
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
int v[]={20,10,5,1};
int main()
{
    // freopen("in.txt","r",stdin);
     //freopen("out.txt","w",stdout);
     //srand(time(NULL));
     int n,m,k,t;//常用全局变量
    while(sf(n))
    {
        int ans=0;
        sf(k);
        map<int,int>p;
        ffr(i,0,n-1) sf(a[i]),p[a[i]]++;
        ffr(i,0,n-1)
        {
            if(k-a[i]==a[i]&&p[a[i]]>=2) ans++,p[a[i]]-=2;
            else if(k-a[i]!=a[i]&&p[a[i]]>=1) ans+=p[k-a[i]],p[a[i]]-=1;
        }
        pf(ans,1);
    }
    return 0;
}


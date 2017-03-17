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
int n,m,t;//常用全局变量
LL a[maxn];
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

int main()
{
    // freopen("in.txt","r",stdin);
     //freopen("out.txt","w",stdout);
     //srand(time(NULL));
    while(sf(n))
    {
        ffr(i,0,n-1) sf(a[i]);
        sort(a,a+n);
        int sum=0;
        while(n>3) sum+=min(a[n-1]+a[0]+a[n-2]+a[0],a[1]+a[0]+a[n-1]+a[1]),n-=2;
        if(n==3) sum+=a[0]+a[1]+a[2];
        else sum+=a[n-1];
        pf(sum,1);
    }
    return 0;
}


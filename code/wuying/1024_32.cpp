#include<cstdio>
#include<cmath>
using namespace std;
int main()
{
    int a,b;
    scanf("%d%d",&a,&b);
    int c=a/b;
    int d1=a-b*c,d2=a-b*c+b,d3=a-b*c-b,ans;
    if(abs(b-d1)<abs(b)) ans=d1;
    else if(abs(b-d2)<abs(b)) ans=d2;
    else if(abs(b-d3)<abs(b)) ans=d3;
    printf("%d\n",ans);
	return 0;
}

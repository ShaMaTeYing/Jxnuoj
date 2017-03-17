#include <stdio.h>
int main()
{
    int n,k,x,y;
    while(~scanf("%d",&k))
    {

            for(x=k+1; x<=k+k; x++)
            {
                y=k*x/(x-k);
                if(y*(x-k)==k*x)
                    printf("1/%d = 1/%d + 1/%d\n",k,x,y);
            }
    }
    return 0;
}


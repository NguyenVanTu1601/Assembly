; Sap xep chon
#include<iostream>
#include<bits/stdc++.h>
using namespace std;

main(){
	int n;
	cin >> n;
	int a[n+1];
	for(int i = 1; i <= n; i++) cin >> a[i];
	for(int i = 1; i < n; i++){
		int min = i;
		for(int j = i + 1; j <= n; j++){
			if(a[j] < a[min]) min = j;
		}
		int temp = a[i];
		a[i] = a[min];
		a[min] = temp;
		cout << "Buoc " << i << ": ";
		for(int j = 1; j <= n; j++){
		    cout << a[j] << " ";
	    }
	    cout << endl;
	}
    return 0;
}
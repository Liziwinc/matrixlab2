#include <iostream>
#include <vector>
#include <limits>

using namespace std;

int getValidInt(int min_num = -1e9, int max_num = 1e9) {
    int value;
    while (true) {
        if (cin >> value && value >= min_num && value <= max_num) {
            return value;
        } else {
            cout << "Error! Input celoe number " << min_num << " - " << max_num << ": ";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }
    }
}

int main() {
    cout << "Input size 1-100";
    int n = getValidInt(1, 100);//!!!

    vector<vector<int>> matrix(n, vector<int>(n));

    cout << "\nInput element of matrix:\n";
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << "Element [" << i << "][" << j << "]: ";
            matrix[i][j] = getValidInt(); //!!!!
        }
    }

    for (int j = 0; j < n; ++j) {
        bool hasNegative = false;
        long long sum = 0;
        for (int i = 0; i < n; ++i) {
            if (matrix[i][j] < 0) {
                hasNegative = true;
                break; 
            }
            sum += matrix[i][j];
        }
        if (!hasNegative) {
            matrix[j][j] = sum;
        }
    }

    cout << "\nNew Matrix:\n";
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << "\t";
        }
        cout << "\n";
    }

    return 0;
}

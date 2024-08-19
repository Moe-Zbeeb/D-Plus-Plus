#include <iostream>
using namespace std;

class Linear
{
private:
    int shape;
    int *a;

public:
    // Constructor
    Linear(int shape, int *data)
    {
        this->shape = shape;
        this->a = new int[this->shape]; // allocate memory for array
        for (int i = 0; i < this->shape; i++)
        {
            a[i] = data[i];
        }
    }

    // Copy Constructor (Deep Copy)
    Linear(const Linear &t)
    {
        shape = t.shape;
        a = new int[shape];
        for (int i = 0; i < shape; i++)
        {
            a[i] = t.a[i];
        }
    }

    // Destructor
    ~Linear()
    {
        delete[] a; // free memory
        cout << "Linear type tensor is freed" << endl;
    }

    // Assignment Operator (Deep Copy)
    Linear& operator=(const Linear &t)
    {
        if (this == &t)
            return *this; // handle self-assignment

        delete[] a; // free existing memory

        shape = t.shape;
        a = new int[shape];
        for (int i = 0; i < shape; i++)
        {
            a[i] = t.a[i];
        }
        return *this;
    }

    // Addition Operator
    void operator+(const Linear &t)
    {
        if (shape != t.shape)
        {
            cout << "Error: shape mismatch" << endl;
            return;
        }
        for (int i = 0; i < shape; i++)
        {
            a[i] += t.a[i];
        }
    }

    // Subtraction Operator
    void operator-(const Linear &t)
    {
        if (shape != t.shape)
        {
            cout << "Error: shape mismatch" << endl;
            return;
        }
        for (int i = 0; i < shape; i++)
        {
            a[i] -= t.a[i];
        }
    }

    // Multiplication Operator
    void operator*(const Linear &t)
    {
        if (shape != t.shape)
        {
            cout << "Error: shape mismatch" << endl;
            return;
        }
        for (int i = 0; i < shape; i++)
        {
            a[i] *= t.a[i];
        }
    }

    // Dot Product (Operatorx)
    int operatorx(const Linear &t)
    {
        if (shape != t.shape)
        {
            cout << "Error: shape mismatch" << endl;
            return 0; // or some other error value
        }
        int b = 0;
        for (int i = 0; i < shape; i++)
        {
            b += a[i] * t.a[i];
        }
        return b;
    }

    // Index Operator
    int operator[](int i)
    {
        if (i >= shape)
        {
            cout << "Error: index out of range" << endl;
            return -1;
        }
        return a[i];
    }

    // Reverse Method
    void reverse()
    {
        for (int i = 0; i < shape / 2; i++)
        {
            int temp = this->a[i];
            this->a[i] = this->a[shape - i - 1];
            this->a[shape - i - 1] = temp;
        }
    }

    // Print Method
    void print()
    {
        cout << "type=linear shape=" << shape << " values=[ ";
        for (int i = 0; i < shape; i++)
        {
            cout << a[i] << " ";
        }
        cout << "]" << endl;
    }
};



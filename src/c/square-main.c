
int square(int i);

int main(void) {
  int i, n;
  for(i = 0; i < 10 ; i++) {
    n = square(i);
  }
}

int square(int i) {
  return i * i;
}

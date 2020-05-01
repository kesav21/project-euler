def sieve(n):
    """
    an implementation of the sieve of erastothenes,
    used to find prime numbers
    """
    primes = list(range(n + 1))
    primes[1] = 0
    for i in primes:
        if i != 0 and i < int(n ** 0.5):
            for j in range(2 * i, n + 1, i):
                primes[j] = 0
    for i in primes:
        if i != 0:
            yield i
    # return [i for i in primes if i != 0]

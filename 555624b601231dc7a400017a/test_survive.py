from survive import survive

def test_7():
    survivor = survive(7, 3)
    assert survivor == 4, "Should be 4"

if __name__ == "__main__":
    test_7()
    print("Everything passed")

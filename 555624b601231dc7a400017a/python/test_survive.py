from survive import survive

def test():
    assert survive(7, 3) == 4, "Should be 4"
    # assert survive(11, 19) == 10, "Should be 10"
    assert survive(1, 300) == 1, "Should be 1"
    assert survive(14, 2) == 13, "Should be 13"
    assert survive(100, 1) == 100, "Should be 100"

if __name__ == "__main__":
    test()
    print("Everything passed")

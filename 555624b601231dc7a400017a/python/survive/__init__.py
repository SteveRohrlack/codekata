def survive(candidateCount: int, eliminateEvery: int) -> int:
    advanceIdxBy = eliminateEvery - 1

    # function internally works on a list of candidates
    candidates = []
    for nr in range(1, candidateCount + 1):
        candidates.append(nr)

    # init index
    idx = advanceIdxBy
    maxIdx = candidateCount - 1

    # as long as there is more than one survivor
    while len(candidates) > 1:
        # remove the candidate at idx and decrement maxIdx
        candidates.pop(idx)
        maxIdx -= 1

        # increment list index by "advanceIdxBy" and handle overflow
        addAll = advanceIdxBy
        while addAll > 0:
            addAll -= 1
            idx += 1
            if idx > maxIdx:
                # overflow by subtracting the max number of elementes (+ 1 because not an index)
                idx -= (maxIdx + 1)

    return candidates[0]

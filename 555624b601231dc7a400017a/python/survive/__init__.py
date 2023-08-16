def survive(candidateCount: int, eliminateEvery: int) -> int:
    advanceIdxBy = eliminateEvery - 1

    # function internally works on a list of candidates
    candidates = []
    for nr in range(1, candidateCount + 1):
        candidates.append(nr)

    # init index
    idx = inc(0, advanceIdxBy, candidateCount)
    maxIdx = candidateCount - 1

    # as long as there is more than one survivor
    while len(candidates) > 1:
        candidates.pop(idx)
        maxIdx -= 1
        idx = inc(idx, advanceIdxBy, maxIdx)
    return candidates[0]

def inc(index: int, by: int, maxIndex: int) -> int:
    newIndex = index
    addAll = by
    while addAll > 0:
        addAll -= 1
        newIndex += 1
        if newIndex > maxIndex:
            # overflow by subtracting the max number (not index)
            newIndex -= (maxIndex + 1)
    return newIndex

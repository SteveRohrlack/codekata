package xbon

func xbon(signature []int, resultCount uint) []int {
	if int(resultCount) <= len(signature) {
		return signature[0:resultCount]
	}

	result := signature
	sigLen := len(signature)

	for i := sigLen; i < int(resultCount); i++ {
		sum := 0

		for j := i - sigLen; j < i; j++ {
			sum += result[j]
		}

		result = append(result, sum)
	}

	return result
}

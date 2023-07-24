package xbon

import (
	"testing"
)

type testInput struct {
	signature   []int
	resultCount uint
}

type test struct {
	input       testInput
	expectation []int
}

func TestXbon1(t *testing.T) {
	tests := []test{
		{
			input: testInput{
				[]int{1, 1, 1, 1},
				10,
			},
			expectation: []int{1, 1, 1, 1, 4, 7, 13, 25, 49, 94},
		},
		{
			input: testInput{
				[]int{0, 0, 0, 0, 1},
				10,
			},
			expectation: []int{0, 0, 0, 0, 1, 1, 2, 4, 8, 16},
		},
		{
			input: testInput{
				[]int{1, 0, 0, 0, 0, 0, 1},
				10,
			},
			expectation: []int{1, 0, 0, 0, 0, 0, 1, 2, 3, 6},
		},
	}

	for _, testcase := range tests {
		res := xbon(
			testcase.input.signature,
			testcase.input.resultCount,
		)
		if len(res) != len(testcase.expectation) {
			t.Fail()
		}

		for i, nr := range res {
			if nr != testcase.expectation[i] {
				t.Fail()
			}
		}
	}
}

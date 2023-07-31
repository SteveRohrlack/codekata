program main
  implicit none
  
  integer, allocatable :: signature(:)
  integer, allocatable :: elements(:)
  integer :: resultCount
  integer :: sigLen 
  integer :: elementSum
  integer :: i
  integer :: j

  ! test scenatio 1

  allocate(signature(4))
  signature = [1,1,1,1]
  resultCount = 10

  ! body

  sigLen = size(signature)

  if (resultCount <= sigLen) then
    print *, signature(0:resultCount)
    deallocate(signature)
    return
  end if

  allocate(elements(resultCount))
  elements(:sigLen) = signature

  do i = sigLen + 1, resultCount
    elementSum = 0

    do j = i - sigLen, i
      elementSum = elementSum + elements(j)
    end do

    elements(i) = elementSum
  end do

  print *, elements

  ! end

  deallocate(signature)
  deallocate(elements)

end program main

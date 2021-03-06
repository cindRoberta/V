// ifirst_part: index of first element of partition
// ilast_part: index of last element of partition
fn partition<T>(mut array_to_sort []T, ifirst_part int, ilast_part int, compare fn (a T, b T) bool) int {
  pivot := array_to_sort[ilast_part]
  mut i := ifirst_part - 1

  for j in ifirst_part..ilast_part {
    if compare(array_to_sort[j], pivot) {
      i++
      //if i != j {
        array_to_sort[i], array_to_sort[j] = array_to_sort[j], array_to_sort[i]
        /*tmp := array_to_sort[i]
        array_to_sort[i] = array_to_sort[j]
        array_to_sort[j] = tmp*/
      //}
    }
  }

  array_to_sort[i + 1], array_to_sort[ilast_part] = array_to_sort[ilast_part], array_to_sort[i + 1]
  /*tmp := array_to_sort[i + 1]
  array_to_sort[i + 1] = array_to_sort[ilast_part]
  array_to_sort[ilast_part] = tmp*/

  return i + 1
}

// ifirst: index of first
// ilast: index of last
fn quick_sort_helper<T>(mut array_to_sort []T, ifirst int, ilast int, compare fn (a T, b T) bool) {
  if ifirst < ilast {
    partition_index := partition<T>(mut array_to_sort, ifirst, ilast, compare)

    quick_sort_helper<T>(mut array_to_sort, ifirst, partition_index - 1, compare)
    quick_sort_helper<T>(mut array_to_sort, partition_index + 1, ilast, compare)
  }
}

fn quick_sort_mutation<T>(mut array_to_sort []T, compare fn (a T, b T) bool) {
  quick_sort_helper<T>(mut array_to_sort, 0, array_to_sort.len - 1, compare)
}

fn quick_sort<T>(array_to_sort []T, compare fn (a T, b T) bool) []T {
  mut array_to_sort_clone := array_to_sort.clone()

  quick_sort_helper<T>(mut array_to_sort_clone, 0, array_to_sort_clone.len - 1, compare)

  return array_to_sort_clone
}

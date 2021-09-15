fn bubble_sort_body<T>(mut array_to_sort []T, compare fn (a T, b T) bool) {
  array_to_sort_len := array_to_sort.len

  for i in 0..array_to_sort_len {
    for j in i + 1..array_to_sort_len {
      if compare(array_to_sort[i], array_to_sort[j]) {
        array_to_sort[i], array_to_sort[j] = array_to_sort[j], array_to_sort[i]
        /*tmp := array_to_sort[i]
        array_to_sort[i] = array_to_sort[j]
        array_to_sort[j] = tmp*/
      }
    }
  }
}

fn bubble_sort_mutation<T>(mut array_to_sort []T, compare fn (a T, b T) bool) {
  bubble_sort_body<T>(mut array_to_sort, compare)
}

fn bubble_sort<T>(array_to_sort []T, compare fn (a T, b T) bool) []T {
  mut array_to_sort_clone := array_to_sort.clone()

  bubble_sort_body<T>(mut array_to_sort_clone, compare)

  return array_to_sort_clone
}

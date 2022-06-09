

extension ListExtension<E> on List<E> {
  List<E> separate(E separator) {
    var result = <E>[];
    for(var i = 0; i < length; i++) {
      result.add(this[i]);
      if(i != length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}
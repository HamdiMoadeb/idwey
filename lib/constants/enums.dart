enum StateStatus {
  init,
  loading,
  loadingMore,
  success,
  error,
}

enum StateEvent {
  isExpired,
  isFull,
  isAvailable,
}

enum TypeHost {
  parPersonne,
  parChalet,
  maisonEntiere,
}

enum TypeReservation { host, activity, event, experience, product }

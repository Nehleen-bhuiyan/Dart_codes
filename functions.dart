enum Status { pending, approved, rejected }

void greet(String name, {int? age}) {}
void main() {
  Status status = Status.pending;
  if (status == Status.pending) {
    print("Pending");
  } else if (status == Status.approved) {
    print("Approved");
  } else if (status == Status.rejected) {
    print("Rejected");
  } else {
    print("Invalid Status");
  }

  greet("Nusaiba");
}

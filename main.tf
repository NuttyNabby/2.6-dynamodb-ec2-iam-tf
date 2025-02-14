resource "aws_dynamodb_table" "books_table" {
  name           = "nabilah-bookinventory"  # Change this if needed
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ISBN"

  attribute {
    name = "ISBN"
    type = "S"
  }

  tags = {
    Name = "BooksInventory"
  }
}

# database
resource "aws_dynamodb_table" "tab_members" {
  name = "${var.project_name}-${var.environment}-tab-members"

  billing_mode = "PROVISIONED"
  read_capacity = 3
  write_capacity = 3

  hash_key = "TabId" # Partition key
  range_key = "MemberName" # Sort key

  attribute {
    name = "TabId"
    type = "S"
  }

  attribute {
    name = "MemberName"
    type = "S"
  }
}

resource "aws_dynamodb_table" "tab_items" {
  name = "${var.project_name}-${var.environment}-tab-items"

  billing_mode = "PROVISIONED"
  read_capacity = 3
  write_capacity = 3

  hash_key = "TabId" # Partition key
  range_key = "ShopId" # Sort Key

  attribute {
    name = "TabId"
    type = "S"
  }

  attribute {
    name = "ShopId"
    type = "S"
  }
}
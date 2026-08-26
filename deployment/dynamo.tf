# database
# Two tables: tab members and tab items

#####################
#### tab members ####
#####################

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

data "aws_iam_policy_document" "dynamodb_tabmembers_rw_polciy_doc" {
  statement {
    effect = "Allow"
    actions = [
				"dynamodb:BatchGetItem",
				"dynamodb:BatchWriteItem",
				"dynamodb:PutItem",
				"dynamodb:DeleteItem",
				"dynamodb:GetItem",
				"dynamodb:Query",
				"dynamodb:UpdateItem"
			]
    resources = [
      aws_dynamodb_table.tab_members.arn,
      "${aws_dynamodb_table.tab_members.arn}/index/*"
    ]
  }
}

resource "aws_iam_policy" "dyanamodb_tabmembers_rw_policy" {
  name = "${var.project_name}-${var.environment}-dynamodb-tabmembers-rw"
  description = "Read/Write access for DynamoDB table tab-members"
  policy = data.aws_iam_policy_document.dynamodb_tabmembers_rw_polciy_doc.json
}



###################
#### tab items ####
###################

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

data "aws_iam_policy_document" "dynamodb_tabitems_rw_polciy_doc" {
  statement {
    effect = "Allow"
    actions = [
				"dynamodb:BatchGetItem",
				"dynamodb:BatchWriteItem",
				"dynamodb:PutItem",
				"dynamodb:DeleteItem",
				"dynamodb:GetItem",
				"dynamodb:Query",
				"dynamodb:UpdateItem"
			]
    resources = [
      aws_dynamodb_table.tab_items.arn,
      "${aws_dynamodb_table.tab_items.arn}/index/*"
    ]
  }
}

resource "aws_iam_policy" "dyanamodb_tabitems_rw_policy" {
  name = "${var.project_name}-${var.environment}-dynamodb-tabitems-rw"
  description = "Read/Write access for DynamoDB table tab-members"
  policy = data.aws_iam_policy_document.dynamodb_tabitems_rw_polciy_doc.json
}
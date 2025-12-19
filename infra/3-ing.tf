resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.voting_app_vpc.id

  tags = {
    Name = "${local.env}-voting-app-igw"
  }

}

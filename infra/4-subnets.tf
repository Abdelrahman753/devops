resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.voting_app_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.AZ1
  tags = {
    Name                                      = "${local.env}-private-subnet-1"
    "kubernetes.io/role/internal-elb"         = "1"
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.voting_app_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.AZ2
  tags = {
    Name                                      = "${local.env}-private-subnet-2"
    "kubernetes.io/role/internal-elb"         = "1"
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.voting_app_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = local.AZ1
  map_public_ip_on_launch = true

  tags = {
    Name                                      = "${local.env}-public-subnet-1"
    "kubernetes.io/role/elb"                  = "1"
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.voting_app_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = local.AZ2
  map_public_ip_on_launch = true
  tags = {
    Name                                      = "${local.env}-public-subnet-2"
    "kubernetes.io/role/elb"                  = "1"
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

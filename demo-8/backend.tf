terraform {
  backend "remote" {
    organization = "crest-data-systems1"
    workspaces {
      name = "terraform-demo"
    }
  }
}

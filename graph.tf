resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "c7f18bfe-e524-4d64-986d-ec7a2a2de631"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "d679e732-1726-4733-9b9c-0f71e430547e"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "60552c76-f87f-4a73-a6d6-d99b39b5d183"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "4bb592bb-5972-4790-abf0-381d616bc8f6"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "a65d991d-f9b5-4c8d-86aa-c4bab2090aac"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "00a245fe-8580-47cb-a1c6-a51c82e41c68"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "ac2f8899-7bc3-4876-aa74-41174963c8d8"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "dfb78f21-1e99-442e-8e48-fb3c0a1510af"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "f3d511d6-fcf5-4b57-9e6f-c2f75fc52192"
  }
}
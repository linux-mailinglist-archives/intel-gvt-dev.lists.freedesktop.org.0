Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C33E5AFC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Aug 2021 15:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F789F61;
	Tue, 10 Aug 2021 13:20:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC87389F6B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Aug 2021 13:20:13 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id y14so3531703uai.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Aug 2021 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=2tvLhkad0w+Mh63WhnFJkmRFgYsLXsJmUqGVjzUAFIo=;
 b=r56fIwbJz5SklG4JA6EP+FkmERPm8EjuNIz1zvYA0Tpmfsnzkuj9Mr9ilB+4O1t4iF
 TJSaAiRseAeimWXIoiZ/aojR4w1dbcHsNBujLSCuMuiKaLluyvcgUi/JEQJlj70o9IEd
 Yl/0OOPV9kllRbjD3zoBaFd2ApzxJDEEHzY9ZJTfL4UXq1/r4AobRJH0IUhbnGDv8HVX
 yiVUloxSQKlbYb1M7BZgm8fAZ9m20jI1slKm68o1oKxPbw8XzrEgPc9oJSx/4tHQe2x8
 HrZw5WHEF9bREO+R7wsyO2DExoyYmOVp3UFrXNeckA4TksY0PWoEs1kePiLiiulK2ynd
 oMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=2tvLhkad0w+Mh63WhnFJkmRFgYsLXsJmUqGVjzUAFIo=;
 b=W57wJP9LDOmbAtyyOJtEbAUmyCEP3XeJlZnZv8FzLf5jTPvyJMd29Fqgltvx8Q0xBw
 k0efoZfm6L9Z8bV8thIB4ddjXMa2C1yIlzSZLvQlXZHLzGt3kYEKWEWIhz4RizVhZoK6
 D2bQxD0Cu0FYw4J/itfohbyTIcqJZRJZe5/yuuz33k5kUOPV5mgyBjZqpYXtqeh9ruDm
 h+KY8T1+lYvffrDQRy5qNLLKsbf48fYR2NlSfXpL6AyTflBTj1t/vNQo0H06o2nKfUuR
 /lZY30Y1jCgkeOtIHtVqhp9fquwq/z4l4xYGRqJVg5Xon4Eylc4GSRzr365UpWL90S6L
 aCoA==
X-Gm-Message-State: AOAM530qJgDtfAkBK1CKQmNEV3gyXlb/PAzYKDHPfqy6xp6DhK+AEbfd
 1ORkoatliMe2Kx8zbWfhvOpi/7MC9DES7XX45+I=
X-Google-Smtp-Source: ABdhPJzvGsx1vfv3zDD0ahziTo63ivIbwfZEjzIqeDHBCiEzkGEl++4p3okNueaG6Xo6XFnebs4VnqPzJeE4UcTii44=
X-Received: by 2002:a9f:2c93:: with SMTP id w19mr9591949uaj.26.1628601612739; 
 Tue, 10 Aug 2021 06:20:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3903:0:0:0:0:0 with HTTP; Tue, 10 Aug 2021 06:20:12
 -0700 (PDT)
From: John Kumor <owo219901@gmail.com>
Date: Wed, 11 Aug 2021 01:20:12 +1200
X-Google-Sender-Auth: zdxQGkl3dqzssRDPO2oW64CMnKw
Message-ID: <CAHdg_cRt+TWqdUjK3Xf84mj5+AwgMtamTmu9J8c3d6u2KdArLQ@mail.gmail.com>
Subject: Urgent
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

My dear,
Greetings! I trust that all is well with you and your family. Did you
receive my previous email?
Regards
John Kumor.

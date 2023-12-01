Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6B800FE2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  1 Dec 2023 17:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99A10E096;
	Fri,  1 Dec 2023 16:17:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C42310E0FE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Dec 2023 16:17:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2839b922c18so2071879a91.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 01 Dec 2023 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701447435; x=1702052235; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cr7cM7fO34/EWWCirV2MEFZOqmdwL2yQHbgrxe1S29E=;
 b=RCykNUy6BO4wXk27z706uoDFH77uJWuQ96+NMeYDoj0XV5o0GYPgofNq1kE1ZDpJ+x
 PXBA07gvw+iOGiDG4J761Yx1tK+nriQjc2fMVh0i1CfRZmMF7co/rxl3cpA8wr3FXYAt
 DDfid/yqUKhwNHb6XT1lmTIk/iKpH30n5cJLNvRP2YKZJQN0ObHLu4PgJMRxw/6vkbGB
 lAzagpgZM/ICyMv3nEw66XKcqmeYbkxEBvyn7oBftqsA5wPCBDwMe/TDfPXDeZ9R4zex
 cZr6IEAU7Jse9fupslgKXvgYAn7WizQo8Az8Zops11HyLCXh4d4rQVc7bjxHlPuisChO
 6lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701447435; x=1702052235;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cr7cM7fO34/EWWCirV2MEFZOqmdwL2yQHbgrxe1S29E=;
 b=Hdou89WFQ6n2WuHFhLIrJeTpxlh8T3F6SaLFVGxLSSlQLOZ0RbPcqLTmpM6Gkh1nFL
 aei/Oz1SNKVK749Y1/J7VCJdiWjZXouwXvw3jqifJMdoS0MGpWOluOQUy1b4Y5Lwj4pS
 UiiDUSqYphcrjdnbRCyZl7SLgKfidViHthsa39AK4LkIM9JBKdUVpBHZR408jWT7hlJ5
 SpXE86qdMdYMEBoqpT1+fEAEpGY7/eAhBxWeyw9IbRJAZ5coTubvh2OMBQ6UhFVkgNpN
 Ezppld6E+iZsOKLomgYc3YTQRkiM3ukGaqFzwQm2/JtPrTwYykeKQ/32UUgT4F1kXP7I
 jJIg==
X-Gm-Message-State: AOJu0YzMotCKJLy0vtnOeQ7D5t6MepqubbSggbSgIdVMQwKL437M2CL6
 cvmz2CKCwx2eThBzb0K/IMcTIPzDCezfN9inNuQ=
X-Google-Smtp-Source: AGHT+IESiN+z5JcDYJIRaEwT3+FCAoNN+76pPjehRDwjBNdNYBEN2TGE7eyWNWkd9P7WxGbhL+rpDlPJAd1/3lgdAac=
X-Received: by 2002:a17:90a:1910:b0:281:d55:6fe8 with SMTP id
 16-20020a17090a191000b002810d556fe8mr21385198pjg.24.1701447435056; Fri, 01
 Dec 2023 08:17:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7301:108c:b0:fc:727:2c9d with HTTP; Fri, 1 Dec 2023
 08:17:14 -0800 (PST)
From: "Mr. Joseph Ben." <michaelwilliam353djj@gmail.com>
Date: Fri, 1 Dec 2023 08:17:14 -0800
Message-ID: <CAO-dGFmLKJRskR8-cvAPLgctsAqNWmQQitno4gbJSZFA8KFPFQ@mail.gmail.com>
Subject: Attention Dear Customer,
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
Reply-To: officialoffice20203@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Attention Dear Customer,

In a recent meeting held with the new Elect President And FBI Director
concerning debt reconciliation, this is to inform you that we have
agreed to
release your fund worth ($5.8 million) which will come via Global
Automatic Teller Machine debit master Card as instructed from our
headquarter by Christopher Wray.
Director of the Federal Bureau of Investigation (FBI).

I will clearly inform you that after the meeting we had with the FBI
director Mr. Christopher Wray, we have agreed to release your fund
worth ($5.8 million) via Global Automatic Teller Machine debit master
Card.

However, the below information is needed as to enable the profiling of
your ATM card and its delivery to you:

1. Full Name:
2. Age\Occupation:
3. Phone Number:
4. delivering Address:
Contact Email..officialoffice20203@gmail.com

Once we receive this required address, we will proceed the delivery
without delay.
Contact Person: Mr. Ben

Thank you.
Mr. Ben
FBI General Director Washington DC USA.

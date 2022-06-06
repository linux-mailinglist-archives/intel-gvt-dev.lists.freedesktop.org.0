Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755F53F174
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Jun 2022 23:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361F011B276;
	Mon,  6 Jun 2022 21:14:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400F211B276
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 21:14:29 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id w2so27888032ybi.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=yAg45i4icGXWCP75tOWAYhBAFx6CRLgoAMP6qmGJPeU=;
 b=h5JvO84l85NedjhqVH3nNTZq996wLlvLASej2d8ABKewlQG2uHI2Or9Ph+KJX1Q3lL
 RbK1qgBVesK0+F8Alw5DCI/XyjEHHI12LeheQDkXRP/WjNdsaFr7p765okd4QUL+JKGC
 /ko9DETGxCZKkDsIedCq7I55hpfGKD90dlGqwZ5Xn3StBYvtM9xc6AzK3902KsLfyEpR
 3WUbq03NvdPMauFWXGKFaEH4Ql2vTKXqFmlGIGvlLQPbihdYu/5LJbPaaIYXm6Z+cAH1
 2uP53k4xqixp59EWCkNqEx9roYoKJWt5O7R041NLzick8fld8wZ+iF+pDzGe5qPkdgGQ
 XWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=yAg45i4icGXWCP75tOWAYhBAFx6CRLgoAMP6qmGJPeU=;
 b=fHPiEyViZ+5ntJKVnu2m+UN1FkjhScbk6Sfq/PNgRFmv63bzkWzGYp9o3bNuV64wko
 f04eyJBKJfdu5v9aAVbHXOi4y1XP1Qm4El0W02KpNgDKy/jVmGw9Us5/qxhtzNsBIBM0
 55MP20R2yGM38CSdWMOCDz9EfK+exV6uJomw/Xi87S6+GnpbLhEDcuVeH6u5qyT9spB2
 v23RPvus04r24e5CV6FHFSSmnkoiZ1/fkLDcqVmGll4RTpsM28+N0ieH84jCHvXlzxDs
 55RXYqUcnjVFBpTCk8LDVpbPxHHvdLjF67nP8hHFae0AqeJ4Nccen8bT6hivVih2D6tH
 aQ1g==
X-Gm-Message-State: AOAM530lSEbUrZs/AfnqWeKnU9KriMRdtg+Q4823wqyGidiYv7b/0onK
 smlzWZVTzhXwkI+yOZw4ixHYf1mChOpGiCU0thQ=
X-Google-Smtp-Source: ABdhPJwlLd2cSIYIyoyLYnIZpAHtGfxJEVnuWWDwGOFKMQN6bvpZ6P5MUVa4gKYSDDsiRQcflB/5NdVOzv2OxBuX/hE=
X-Received: by 2002:a25:2ac9:0:b0:65d:3dca:9638 with SMTP id
 q192-20020a252ac9000000b0065d3dca9638mr27084992ybq.196.1654550068490; Mon, 06
 Jun 2022 14:14:28 -0700 (PDT)
MIME-Version: 1.0
From: Elizabeth Mark <elizabethmark12022@gmail.com>
Date: Tue, 7 Jun 2022 05:14:17 +0800
Message-ID: <CADtbehRpXsqXbcpEqfq-jC8Anu_zGUaQbZ2Mtq1S5tP6S=ejAQ@mail.gmail.com>
Subject: =?UTF-8?B?0JfQtNGA0LDQstC10LnRgtC1?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000001877f605e0cdf559"
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
Reply-To: elizabethmark12022@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000001877f605e0cdf559
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

INCX0LTRgNCw0LLQtdC50YLQtQ0KICDQnNC+0LvRjywg0YHQutGK0L/QuCwg0LzQvtC20LXRgtC1
INC70Lgg0LTQsCDQvNC4INC60LDQttC10YLQtSDQv9GA0LjRh9C40L3QsNGC0LAsINC/0L7RgNCw
0LTQuCDQutC+0Y/RgtC+INC90LUg0YHRgtC1DQrQvtGC0LPQvtCy0L7RgNC40LvQuCDQvdCwINGB
0YrQvtCx0YnQtdC90LjQtdGC0L4g0LzQuA0KICDQktCw0YjQuNGP0YIg0YHQtdGA0LbQsNC90YIg
0JXQu9C40LfQsNCx0LXRgtCwINCc0LDRgNC6DQpIZWxsbw0KIFBsZWFzZSBkZWFyIGNhbiB5b3Ug
bGV0IG1lIGtub3cgdGhlIHJlYXNvbiB3aHkgeW91IGhhdmUgbm90IHJlcGx5IG15DQptZXNzYWdl
DQogWW91ciBzZXJnZWFudCBFbGlzYWJldHRhIE1hcmsNCg==
--0000000000001877f605e0cdf559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+wqDQl9C00YDQsNCy0LXQudGC0LU8YnI+wqAg0JzQvtC70Y8sINGB0LrR
itC/0LgsINC80L7QttC10YLQtSDQu9C4INC00LAg0LzQuCDQutCw0LbQtdGC0LUg0L/RgNC40YfQ
uNC90LDRgtCwLCDQv9C+0YDQsNC00Lgg0LrQvtGP0YLQviDQvdC1INGB0YLQtSDQvtGC0LPQvtCy
0L7RgNC40LvQuCDQvdCwINGB0YrQvtCx0YnQtdC90LjQtdGC0L4g0LzQuDxicj7CoCDQktCw0YjQ
uNGP0YIg0YHQtdGA0LbQsNC90YIg0JXQu9C40LfQsNCx0LXRgtCwINCc0LDRgNC6PGJyPkhlbGxv
PGJyPsKgUGxlYXNlIGRlYXIgY2FuIHlvdSBsZXQgbWUga25vdyB0aGUgcmVhc29uIHdoeSB5b3Ug
aGF2ZSBub3QgcmVwbHkgbXkgbWVzc2FnZTxicj7CoFlvdXIgc2VyZ2VhbnQgRWxpc2FiZXR0YSBN
YXJrwqDCoDxicj48L2Rpdj4NCg==
--0000000000001877f605e0cdf559--

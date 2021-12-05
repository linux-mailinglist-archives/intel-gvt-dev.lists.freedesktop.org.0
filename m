Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5526E46937C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Dec 2021 11:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5967673D67;
	Mon,  6 Dec 2021 10:20:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2906372CE9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  5 Dec 2021 03:38:30 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k23so14188522lje.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 04 Dec 2021 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=QarC29jPS4dy8I/WiAgw54rL6Oj73f5hXVCg2cu9dBA=;
 b=dzr9VsJdHFu4jYQ71GAy5zIHLYHtMoUS5FC2epDx4EsJAr9r516nJbuEgbOKLrObWt
 FWBcFNS/0OcTHXp0ZYsuVcISECfYXlNjfpDB/1DkOQ8wnnwWwiF5aGLHQYUjJE7+KRjr
 S7ag6e6839meBMNlZLrZog46JMJBZrVf8MPhQgWaYDDHXSESQYUyPqWLScDNY/4QwOHN
 4PChOrYk6P2S/GjbqAidYF9PB0sTSgzSYO72/NUoqYXqbUejlGhNTuYwxN+Y/lMQ2+15
 gMG9zVxCxcQv/HpYwKEfBJoDkw7WxCCIaHKOlqsqqWLFCesnt0xGytCDTJz6OX3LEqc8
 GEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QarC29jPS4dy8I/WiAgw54rL6Oj73f5hXVCg2cu9dBA=;
 b=GLrNEiRVbZlBzW2DhH15Ckh6/PRulTgtJ9N3ei9mFCwXpc7Axe+bzqEvdkRUkeQujf
 h0sE0HIGsOCB+wa0HGpvWS0D7fFCZoY+0JjfHRMgi5cKYLrs45kYeNXhMR3SevothBCC
 wyAXew0ZlUeMFY+7J/+UJ7igJ0A3ERjXjJneo8CosJ0qECTU9ak8O7n3GJLz7chQgTif
 Zmk+xr1HFZJX21GSNFLWryNRHyyTws/zrfXmvvzPARag0Q2oYXrfc3YRVTGKM+q0poZv
 39AR7E0T7wsGaFZ+hKCwglFoorLti9i+F10arGo82RqXOYMwtW82K3IWtQyKlY9UvGtE
 s7Xw==
X-Gm-Message-State: AOAM533w0L+l3m6KhUW3p+CpwwmQU2xtX7uvuj3G9HlOptmGUoHmLRK5
 l5JNVT0eM46pHyQf8FEUZdN6Pc/Fyi1pR0bbVkQ=
X-Google-Smtp-Source: ABdhPJyOzHomhRg/PBQqICCi0XNoO/azxBlWeH25SnD2qqR3HOyw507HjIroMO89Pc+1om552/dX+5d6MT3b8aaxkvg=
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr27249971ljp.249.1638675508355; 
 Sat, 04 Dec 2021 19:38:28 -0800 (PST)
MIME-Version: 1.0
From: hi <royalnationalhospitalh@gmail.com>
Date: Sun, 5 Dec 2021 09:08:16 +0530
Message-ID: <CADBYqjNncYWNQrMw9rcSwdCXATCdqPOEcFJY=LAQZRU0FM6z6Q@mail.gmail.com>
Subject: 6-0
To: undisclosed-recipients:;
Content-Type: multipart/mixed; boundary="00000000000093fef405d25ddfbe"
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

--00000000000093fef405d25ddfbe
Content-Type: multipart/alternative; boundary="00000000000093fef105d25ddfbc"

--00000000000093fef105d25ddfbc
Content-Type: text/plain; charset="UTF-8"



--00000000000093fef105d25ddfbc
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--00000000000093fef105d25ddfbc--

--00000000000093fef405d25ddfbe
Content-Type: text/plain; charset="Shift_JIS"; name="5.txt"
Content-Disposition: attachment; filename="5.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kwsp1ny90>
X-Attachment-Id: f_kwsp1ny90

Y1NDQU1NRUQgVklDVElNUyAkNzUwLDAwMFVTRCBET0xMQVJTIEJFTkVGSUNJQVJZLiAgIGJyaXRp
c2hoaWdoY29tbWkxMTFAZ21haWwuY29tDQpSRUYvUEFZTUVOVFMgQ09ERTogRUNJTkJELyAkNzUw
LDAwMFVTRCBET0xMQVJTLk5FVyBERUxISSCWSU5ESUEgU0NBTU1FRCBWSUNUSU1TIENPTVBFTlNB
VElPTiBPRiAkNzUwLDAwMCBVU0QuDQpBVFRFTlRJT04gQkVORUZJQ0lBUlkNClRoZSBCcml0aXNo
IEhpZ2ggQ29tbWlzc2lvbiBpbiBJbmRpYSBpcyB0aGUgcmVwcmVzZW50YXRpdmUgb2YgdGhlIEhl
YWQgb2YgU3RhdGUgb2YgdGhlIFVuaXRlZCBLaW5nZG9tLiBJdCBpcyBsb2NhdGVkIGF0IE5ldyBE
ZWxoaS4gVGhlIEJyaXRpc2ggSGlnaCBDb21taXNzaW9uIGluIE5ldyBEZWxoaSBjb3ZlcnMgY29u
c3VsYXIgc2VydmljZXMgZm9yIE5vcnRoZXJuIEluZGlhLCBuYW1lbHksIERlbGhpIGFuZCB0aGUg
c3RhdGVzIG9mIEphbW11IGFuZCBLYXNobWlyLCBIYXJ5YW5hLCBQdW5qYWIsIFV0dGFyIFByYWRl
c2gsIEhpbWFjaGFsIFByYWRlc2gsIFJhamFzdGhhbiwgYW5kIFV0dGFyYW5jaGFsLiBPbiBiZWhh
bGYgb2YgdGhlIEJyaXRpc2ggSGlnaCBDb21taXNzaW9uIGFuZCB0aGUgTWV0cm8gQmFuayBPZiBV
bml0ZWQgS2luZ2RvbSwgd2Ugd2lzaCB0byBub3RpZnkgeW91IGFzIGEgYmVuZWZpY2lhcnkgb2Yg
JDc1MCwwMDBVU0QgKFNldmVuIEh1bmRyZWQgQW5kIEZpZnR5IFRob3VzYW5kIERvbGxhcnMpIGlu
IGNvbXBlbnNhdGlvbiBvZiBpbnRlcm5ldCBzY2FtLg0KV2UgYXJlIGRlbGVnYXRlZCBmcm9tIHRo
ZSBCcml0aXNoIEhpZ2ggQ29tbWlzc2lvbiBpbiBOZXcgRGVsaGkgSW5kaWEsIGFuZCB0aGUgTWV0
cm8gQmFuayBVSyB0byBwYXkgMTUwIHZpY3RpbXMgb2YgaW50ZXJuZXQgYW5kIHZhcmlvdXMgc2Nh
bXMgJDc1MCwwMDBVU0QgZWFjaCB5b3VyIEUtbWFpbCBpZCB3YXMgbGlzdGVkIGFuZCBhcHByb3Zl
ZCBmb3IgdGhpcyBwYXltZW50IGFzIG9uZSBvZiB0aGUgc2NhbSB2aWN0aW1zLiBBY2NvcmRpbmcg
dG8gdGhlIGxhc3QgbWVldGluZyBoZWxkIG92ZXIgaGVyZSBpbiB0aGUgQnJpdGlzaCBIaWdoIENv
bW1pc3Npb24sIGl0IHdhcyBicm91Z2h0IHRvIG91ciBub3RpY2Ugb2YgdGhlIHZhcmlvdXMgdHlw
ZSBvZiBzY2FtIHdoaWNoIGhhcyBiZWVuIGdvaW5nIG9uIGluIG91ciB3b3JsZCB0b2RheSwgbWFu
eSBwZW9wbGUgaGF2ZSBhbGwgbG9zdCB0aGVpciBwcm9wZXJ0aWVzIGFuZCBzbyBtYW55IG9mIHRo
ZW0gaGF2ZSBldmVuIGdvbmUgaW50byBiYW5rcnVwdGN5IGJlY2F1c2Ugb2YgdGhpcyBob29kbHVt
cy4NClBsZWFzZSB5b3UgYXJlIGhlcmVieSBhZHZpc2VkIHRvIGZpbGwgdGhlIGFwcHJvcHJpYXRl
IGZvcm0gYmVsb3cgZm9yIHRoZSByZWxlYXNlIG9mIHlvdXIgY29tcGVuc2F0aW9uIGZ1bmQgaW1t
ZWRpYXRlbHkuDQoxLkZVTEwgTkFNRVM6CQ0KMi5DT05UQUNUIEFERFJFU1MJDQozLk1PQklMRSBO
VU1CRVI6CQ0KNC5TRVgvQUdFOgkNCjUuQ09VTlRSWToJDQo2Lk9DQ1VQQVRJT046CQ0KNy5NQVJJ
VEFMIFNUQVRVUzoJDQo4LklEIFBST09GIE9SIFBBU1NQT1JUOg0KOS5BTk5VQUwgSU5DT01FOg0K
MTAuSE9XIERPIFlPVSBGRUVMIEFCT1VUIFRISVM/DQoxMSBNQUtFIFNVUkUgWU9VIFNFTkQgWU9V
UiBSRVBMWSBUTyBUSElTIEUtTUFJTDsgICBicml0aXNoaGlnaGNvbW1pMTExQGdtYWlsLmNvbQ0K
WW91IGFyZSB0byBpbW1lZGlhdGVseSBwcm92aWRlIHdpdGggdXMgKEJyaXRpc2ggSGlnaCBDb21t
aXNzaW9uKSB5b3VyIGZ1bGwgZGV0YWlscyBpbiB0aGUgZm9ybSBhYm92ZTsgdG8gZW5hYmxlIHVz
IGZhY2lsaXRhdGVzIHRoZSByZWxlYXNlIG9mIHlvdXIgY29tcGVuc2F0aW9uIGZ1bmQgdG8geW91
IGltbWVkaWF0ZWx5IHdpdGhvdXQgZGVsYXkgb3Igd2hhdCBzbyBldmVyLiBZb3UgYXJlIG5vdCB0
byBkdXBsaWNhdGUgb3IgY29tbXVuaWNhdGUgd2l0aCBhbnkgb25lIGFib3V0IHRoaXM7IHdlIGFy
ZSBpbiB0cmFjZSBvZiB0aGVzZSBob29kbHVtcy4NCllvdXJzIFRydWx5IEZyYW5jZXMgSG9vcGVy
DQpCcml0aXNoIEhpZ2ggQ29tbWlzc2lvbiBOZXcgRGVsaGk=
--00000000000093fef405d25ddfbe--

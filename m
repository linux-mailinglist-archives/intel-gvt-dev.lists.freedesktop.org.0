Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A2469389
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Dec 2021 11:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFECC73E77;
	Mon,  6 Dec 2021 10:20:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2B172CF5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  5 Dec 2021 03:41:35 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso9033784otj.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 04 Dec 2021 19:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ubZyv8FFTEC8mV48YVPyt1VHA6ykeqbAf/khyA7hP4k=;
 b=L1qO15rwD5KqpO11NCjvea/6st60No38z7DWFzGD6h4qMfMc3cjXwFzITGCehp27V1
 eolPJCx2Pi3dDILNDbixZwObWDsVxdpVC/iYTsAs9dFG1sVQlYXV0+7rhhou61a8zh7w
 3AIM6z9W+qWs8dkXzSENMHXv42yQZVk2TnlRlQpIVR5JBEIWx30DwVVsz4cUhS0mCm/a
 WlbruXgO3N2BMTRG7UA4bCxzcIAB6VYECqhI2M4Xs0chq5GOEMfCsHfgBB+0qSPLToEJ
 JkwdgphVIaLPB1dFIgMl5/xxP6kZkJ9YyWnLAkLjOLuMsPLPU4xSGv2RnIkUnavtF0n6
 jrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ubZyv8FFTEC8mV48YVPyt1VHA6ykeqbAf/khyA7hP4k=;
 b=Wed7KPeAr20sFEU8RuZluKRPZMCaXx2EpEWr3Gpp2Ft5Lo5WrDTZ3BeQDe7znxrw63
 pVDun8QcKiWplvGVhGwfr4wkki1TeeZp2bCfO2ykPsEa1RMUx7FrPpWEHnxlTscI9U2Z
 Lyg+Mo/9KHEqf5kxR8T6DTdynd0cFvbYEf4ZEZIYoPLUbLtFqiodnuIfEYKPq8/ACoft
 daVbIckUxg5RFeJ22iqlZ0L8nJurIHqE9B5UKshYEKUxjqMKYSt1WWmS80M1EL0e7dn6
 vf3tJAfm5c8VDzt3+9yzt8dFZdvAjWiaNxsxbMaoIlL5lfUUfwFFLKbWdA0UGh2OhXtT
 CKsA==
X-Gm-Message-State: AOAM533V9BC2BKrObW2rbqt7S0Df6py8Cihpokn/SD/xOH1oYLfp/rqW
 AWqh/uPUucHn7HOpSLPsdoII/dpP3OgRXoV8IL8=
X-Google-Smtp-Source: ABdhPJylAXvu/rfwZ218lbLzlfHpqtE2bIDwaiKwT54EnpMcVVyHOTskznN7pTarpdC28d2D1mxqKgDMh5waXecahUI=
X-Received: by 2002:a05:6830:8e:: with SMTP id
 a14mr22239464oto.280.1638675694994; 
 Sat, 04 Dec 2021 19:41:34 -0800 (PST)
MIME-Version: 1.0
From: hi <carecruitmentsdpt@gmail.com>
Date: Sun, 5 Dec 2021 09:11:22 +0530
Message-ID: <CAMVsiXa9jso0w6PqX9U28K55oEiCTztvjyGzsmK7JLvWcNt0yA@mail.gmail.com>
Subject: 1-A
To: britishhighcommi111@gmail.com
Content-Type: multipart/mixed; boundary="000000000000b43f3b05d25deafd"
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

--000000000000b43f3b05d25deafd
Content-Type: multipart/alternative; boundary="000000000000b43f3905d25deafb"

--000000000000b43f3905d25deafb
Content-Type: text/plain; charset="UTF-8"



--000000000000b43f3905d25deafb
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000b43f3905d25deafb--

--000000000000b43f3b05d25deafd
Content-Type: text/plain; charset="windows-1252"; name="a-c.txt"
Content-Disposition: attachment; filename="a-c.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kwsp5c9l0>
X-Attachment-Id: f_kwsp5c9l0

VGhpcyBpcyB0byBpbmZvcm0geW91IHRoYXQgeW91IGhhdmUgd29uIGEgcHJpemUgbW9uZXkgb2Yg
ozUwMCwwMDAuMDAsKE9uZSBIdW5kcmVkIGFuZCBGaWZ0eSBUaG91c2FuZCBQb3VuZHMpZnJvbSB0
aGVDb2NhLUNvbGEgTG90dGVyeSBwcm9tb3Rpb24gVW5pdGVkIEtpbmdkb20gd2hpY2ggaXMgb3Jn
YW5pemVkIGJ5IENvY2EtQ29sYSBpbiBjb25qdW5jdGlvbiB3aXRoIENoZXZyb24gVGV4YWNvIE9p
bCBhbmQgR2FzIENvbXBhbnksIJNZb3VyIEVtYWlsIEFkZHJlc3MiIHdlcmUgc2VsZWN0ZWQgdGhy
b3VnaCBhIGNvbXB1dGVyIGJhbGxvdCBzeXN0ZW0gZHJhd24gZnJvbSBOaW5lIGh1bmRyZWQgdGhv
dXNhbmQgZW1haWwgZnJvbSBDYW5hZGEsIEF1c3RyYWxpYSwgVW5pdGVkIFN0YXRlcywgQXNpYSwg
RXVyb3BlLCBNaWRkbGUgRWFzdCwgQWZyaWNhIGFuZCBPY2VhbmljIGFzIHBhcnQgb2Ygb3VyIGlu
dGVybmF0aW9uYWwgcHJvbW90aW9ucyBwcm9ncmFtIHdoaWNoIGlzIGNvbmR1Y3RlZCBhbm51YWxs
eSwgd2UgaGF2ZSBvbmx5IHNlbGVjdGVkIDIwIHBlb3BsZSBhcyBvdXIgd2lubmVycywgdGhyb3Vn
aCBlbGVjdHJvbmljIGJhbGxvdCBTeXN0ZW0gd2l0aG91dCB0aGUgd2lubmVyIGFwcGx5aW5nLiAN
ClZFUklGSUNBVElPTiBBTkQgRlVORFMgUkVMRUFTRSBGT1JNDQoxLiBGdWxsIG5hbWU6CQkNCjIu
IEFkZHJlc3M6DQozLiBTZXggYW5kIEFnZQ0KNC4gU3RhdGU6IA0KNS4gVGVsZXBob25lIE51bWJl
cjoNCjYuIE9jY3VwYXRpb246IA0KNy4gRW1haWw6DQo4LlN0YW1wIFNpemUgUGhvdG86CQ0KOC4g
QmFuayBOYW1lLCBBY2MgTm8gYW5kIElmc2MgQ29kZToNClRvIGNsYWltIHlvdXIgcHJpemUsIHBs
ZWFzZSBmaWxsIGFuZCBzdWJtaXQgeW91ciB2ZXJpZmljYXRpb24gZm9ybSBpbW1lZGlhdGVseSB2
aWEgZW1haWwuIA0KRHIuIFJpY2hhcmQgRG9tbmljICAgd29ybGRjb2xhQGV1cm9wZS5jb20NCkZv
cmVpZ24gU2VydmljZSBNYW5hZ2VyIA0KQ29jYS1Db2xhIExvdHRlcnkgKFB2dCkgTHRkLiANClRl
bDogKzQ0NzQ0ODcyMjI2NjcNCkVtYWlsOiB3b3JsZGNvbGFAZXVyb3BlLmNvbQ0KSSB3YW50IHRv
IENvbmdyYXR1bGF0ZSBZb3UgSW4gQWR2YW5jZSBhbmQgUGxlYXNlIERvIE5vdCBGb3JnZXQgdG8g
SGVscCB0aGUgUG9vciBJbiB0aGUgU29jaWV0eSBXaGVuIENvY2EtQ29sYSBNYWtlcyBZb3UgYSBC
ZW5lZmljaWFyeSBPZiB0aGVpciBXb3JsZCBPZiBXZWFsdGguDQpDb25ncmF0dWxhdGlvbnMgb25j
ZSBhZ2FpbiAhISENCg==
--000000000000b43f3b05d25deafd--

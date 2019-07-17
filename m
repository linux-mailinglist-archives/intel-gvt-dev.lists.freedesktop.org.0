Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC76B7B3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 09:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3716E282;
	Wed, 17 Jul 2019 07:55:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7D6E282
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 07:55:09 +0000 (UTC)
Received: from localhost (unknown [113.157.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B27DC2077C;
 Wed, 17 Jul 2019 07:55:08 +0000 (UTC)
Date: Wed, 17 Jul 2019 16:55:07 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page
 mapping
Message-ID: <20190717075507.GA14238@kroah.com>
References: <1563378987-21880-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563378987-21880-1-git-send-email-xiaolin.zhang@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563350109;
 bh=Za+2Z/KvbFxy7TAfDN86HVciROQnNMDwUAxkAE548iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPA2brW/gUgNjPQkKr4q84B5qjQIS048StG5wruBzelsrVEalzqDau7MnLX4HoBaa
 kcqrEX59baIvYd9lDujDt3bg7wzV24NbMuc5I7469eF4/G80P19fz9AkEofT/C+88a
 RQOtxDU4o5Hr6TrrSeigxLLig09+kEn4RKGxj1uI=
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTE6NTY6MjdQTSArMDgwMCwgWGlhb2xpbiBaaGFuZyB3
cm90ZToKPiBHUFUgaGFuZyBvYnNlcnZlZCBkdXJpbmcgdGhlIGd1ZXN0IE9DTCBjb25mb3JtYW5j
ZSB0ZXN0IHdoaWNoIGlzIGNhdXNlZAo+IGJ5IFRIUCBHVFQgZmVhdHVyZSB1c2VkIGR1cm5pbmcg
dGhlIHRlc3QuCj4gCj4gSXQgd2FzIG9ic2VydmVkIHRoZSBzYW1lIEdGTiB3aXRoIGRpZmZlcmVu
dCBzaXplICg0SyBhbmQgMk0pIHJlcXVlc3RlZAo+IGZyb20gdGhlIGd1ZXN0IGluIEdWVC4gU28g
ZHVyaW5nIHRoZSBndWVzdCBwYWdlIGRtYSBtYXAgc3RhZ2UsIGl0IGlzCj4gcmVxdWlyZWQgdG8g
dW5tYXAgZmlyc3Qgd2l0aCBvcmdpbmFsIHNpemUgYW5kIHRoZW4gcmVtYXAgYWdhaW4gd2l0aAo+
IHJlcXVlc3RlZCBzaXplLgo+IAo+IEZpeGVzOiBiOTAxYjI1MmI2Y2YgKCJkcm0vaTkxNS9ndnQ6
IEFkZCAyTSBodWdlIGd0dCBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5n
IDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2t2bWd0LmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKCjxmb3JtbGV0dGVyPgoKVGhpcyBpcyBub3QgdGhlIGNvcnJlY3Qgd2F5IHRvIHN1
Ym1pdCBwYXRjaGVzIGZvciBpbmNsdXNpb24gaW4gdGhlCnN0YWJsZSBrZXJuZWwgdHJlZS4gIFBs
ZWFzZSByZWFkOgogICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJv
Y2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKZm9yIGhvdyB0byBkbyB0aGlzIHByb3Blcmx5
LgoKPC9mb3JtbGV0dGVyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=

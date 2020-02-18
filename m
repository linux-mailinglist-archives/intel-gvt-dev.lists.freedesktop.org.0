Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47B16272C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Feb 2020 14:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82956E9FF;
	Tue, 18 Feb 2020 13:34:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8446E9FF;
 Tue, 18 Feb 2020 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KgBM6fQQFUnEKedrviIsfqnGvqAjw1bEntua8R0ABEE=; b=JxR1ui9pvq96WRptdQ91aeGGZ
 J+9gG0zLOJqRpHrLGKhTb4vqq8ovXKgsGZXSZC1cdA4jHCHe8VzEM96OwDR1Od3oUDAtsEiKZHAfK
 AfJX0sBUBx1PdjN5wW1UGOTa5aK9kTfStSf3dyLBH3jDZI9Yr49JQD5crxrWUxjUTza7gRBhX1HCC
 VqDutM6atnRkunkPjeGsUsSnSOLT0uWt9D8Ys5YoEItq9J9OajhVYQH816KPGP9sc+bCIZY46hMT5
 eiZdBzb4XC4HvPQIBJqIoEV65SJBWDEImdTuR8kyT2LYNHsJem4EB5zR0AAQ5h4/FQUDcFwA24txv
 vCD+cf0Mw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j430i-0003Ai-PM; Tue, 18 Feb 2020 14:34:00 +0100
Received: from [2a02:8106:231:700:6975:3446:3ada:292d]
 (helo=localhost.localdomain)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j430i-0008RU-Fa; Tue, 18 Feb 2020 14:34:00 +0100
Message-ID: <70deaa05d3a130a91a3757b7a343bbdffccd90be.camel@cyberus-technology.de>
Subject: Re: [PATCH v2 RESEND] drm/i915/gvt: make gvt oblivious of kvmgt
 data structures
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 18 Feb 2020 14:33:59 +0100
In-Reply-To: <20200218085028.GA31442@zhen-hp.sh.intel.com>
References: <20200217163858.26496-1-julian.stecklina@cyberus-technology.de>
 <20200218085028.GA31442@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
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
Cc: thomas.prescher@cyberus-technology.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hang.yuan@intel.com, zhiyuan.lv@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2020-02-18 at 16:50 +0800, Zhenyu Wang wrote:
> Looks this needs some backmerge first to apply, I'll include this
> for -next pull later.

I usually base these patches on gvt-staging. If there is some other branch to
rebase them onto to make your life easier, just point me to it.

> Thanks for resend.

No problem!

Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

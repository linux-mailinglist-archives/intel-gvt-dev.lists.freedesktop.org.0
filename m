Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42B18F722
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Mar 2020 15:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73136896FA;
	Mon, 23 Mar 2020 14:42:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46307896FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Mar 2020 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=90l1So4/dfUv8n7RSEbzXvtgna8xMa4C0MIY/wF7W/s=; b=GBQiFbJRkcIQtIQmiq28TEjpL
 YnvRYaWD2pBXsKjUJ5RzqITIrUoN8luSFbuYfKaToI5G1lTIxTb6rFyIEhNB534MNZYkUVn3XDrpG
 ll2+7wm7ZCnmDX3koTk4HcLLLqCRVOX71xTx03LNB+MHM6qNvkJ0ZTrfKgN6epmlbGs+O9bZdbn/s
 Fn3qMzIZYgAvNRVuMGd8o7oVV8pbqbIhTZVhLPJuC0Z8TqFUqfqX8cMvvDc/Wlr2zCauItCsuNe6I
 2DPdrTW/HK5QYPRUtriRDSQyBvU/0agpmidUbdOwO853Pp9pb8HuhvYDMmoEtu2VaJgjvWoJU/s34
 SFFXsCztA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jGOI2-0005AA-HJ; Mon, 23 Mar 2020 15:42:55 +0100
Received: from [2001:16b8:571f:9100:334a:4528:15dd:476e] (helo=linux.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jGOI2-000HI0-AL; Mon, 23 Mar 2020 15:42:54 +0100
Message-ID: <a27b0cb71265f503f3dd3d1823f44962f1130ee5.camel@cyberus-technology.de>
Subject: Re: GVT State Save/Restore
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Mon, 23 Mar 2020 15:42:53 +0100
In-Reply-To: <20200322064504.GM8880@zhen-hp.sh.intel.com>
References: <460869e24c55da66c43e3cbdf77b4af5f9a0bbeb.camel@cyberus-technology.de>
 <20200322064504.GM8880@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25760/Mon Mar 23 14:12:45 2020)
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, 2020-03-22 at 14:45 +0800, Zhenyu Wang wrote:
> On 2020.03.20 11:49:46 +0100, Julian Stecklina wrote:
> > Hi everyone,
> > 
> > I'm researching what needs to be done to enable VMs with a GVT device to be
> > saved to disk and restored. This is similar to live migration in the sense
> > that
> > state of the vGPU needs to be serialized and deserialized, but simpler,
> > because
> > no dirty page tracking is needed.
[...]
> > It doesn't seem like any of the patches actually made it upstream. Are there
> > some newer PoC patches to look at or did I miss some functionality in the
> > mediator?
> > 
> 
> cc Yan, who is working on upstream VFIO interface and GVT change for
> migration.
> 
> We have an old topic branch on 
> https://github.com/intel/gvt-linux/commits/topic/gvt-migration-yan
> which had working GVT migration support based on older interface proposal.
> 

Excellent! We are going to check this out.

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

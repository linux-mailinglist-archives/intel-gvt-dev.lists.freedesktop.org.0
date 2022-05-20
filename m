Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B352E45C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 May 2022 07:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9A110E605;
	Fri, 20 May 2022 05:33:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD510E605;
 Fri, 20 May 2022 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=iTRcYTOvhEdVV51lLDf6QZYcjj
 FcqmaXZnopcFHUJw9Dh/KCjy4JXxOX3g6wOK7BWkoPbuqAEOMh9lmKWSSa/lbfHOAo6WDGbEc0eJu
 GvXENhFDPGBOT3j8PhAvYulPs1/uB7pCAKWtd4PsRD+h/GR73uZi7ZvQE/+pRPIScsIfknh+XPkit
 bxGvFELHkQnZ2mbuoNLoz3Dogoue0FU4lc1t94t85qnQrvvrWJenQF3chMlGiDC0Fp/y9LdSGhaxf
 6FBrmE6lR/sCBYCQmIkaxAB0som6zb5Vtd1s3Y2pnjF+D2q2JAy/HLGY+s23cr/2UyZ8mVnw7rdXN
 +zEA27mg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nrvGb-00AciW-D8; Fri, 20 May 2022 05:33:37 +0000
Date: Thu, 19 May 2022 22:33:37 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Message-ID: <YocoMdqLv0s3GV2f@infradead.org>
References: <20220519183311.582380-1-mjrosato@linux.ibm.com>
 <20220519183311.582380-2-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519183311.582380-2-mjrosato@linux.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, hch@infradead.org,
 linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 alex.williamson@redhat.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

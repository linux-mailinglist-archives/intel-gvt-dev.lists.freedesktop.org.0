Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1C6BE23E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Mar 2023 08:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B09110E36D;
	Fri, 17 Mar 2023 07:54:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230D10E355;
 Fri, 17 Mar 2023 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679039644; x=1710575644;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=ohqe+1mGU1aWaqzW+W72vIR1GkavpoyYj+ZbtKjzoW8=;
 b=lokxHqNBTOvcDU1ExXsGHKkdKS7JVQYQHtMsmXAYq9C/mZvFKybYZKCu
 kqMwD1zLOryJG7HOrXZpF8E4S5J4AzW3WWSc2ds8UP5LSQdcEyg0qE9jm
 oOrWhnKn0qz5K54J/W4Ll43CMRcVAo5NOv4v5BEhzBp0B6bSeAwHLkiNf
 aCuy4lC54A1i+WE+IeLcR4VgLEHke0fTMYU2GuU4qnAU3jEfHMyhRj/z6
 BOyNggoISy7KRtxjALCITaKAqRL3ZzoylPgv5Rb6uNS+8kQqoXgXzc3Ui
 JL5SymLJlhlua4GZvW/yivXkoMPAoqzIAOrvNJ2mrwe3QZV6UlF0heyoe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400786555"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="400786555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 00:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710413967"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="710413967"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 00:53:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 00:53:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 00:53:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 00:53:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 00:53:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuFnDUDTWzDHFOFSIaJQzRbhox9LD2f1ths+6fi06D546dqLx4/Gyt5dIT85ljFH+w6KRiHIgMrj/cwZaUqKUNmDhjD8/3UjJoVNHR2NAglACpYH+cfTk2s12/d3peYEguFOPTiwFlJmdRKebVwi3FPK8831aAhKIkAEOrSMKx13KSIA6ogiUdQrHIS1qVrPT1kUt45cHEun5O2aha8JuzeMNA9faU0oM47blx+Yc1QSds76NUaEpYG8bfu5tw9dr3DuNu+PpR6IblpBhRZbMtA8Nm7qS9DZ6sntUDxNicqEMRBkcqkHpV97KBxfxPk6f7UMEk14qLl5WSHSoj6WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=carNRC1lACSOyuKUmm7SD3Tto1LFVYWmd8BkApGatxE=;
 b=IXHKGGyXCFkyuJc/ymDmN36BSL3Kz2PtRq4WJeycBt6oK7RGBAU3XZBOukavNtqmMjEdaxuuawZMGDqiPqj04OFWajw2NCHEus/PFVE86zqbRO190O6zPAsk6FerujRU11QnJSfNFAGzHOgQ6XzLRjk9GudNP87f6DVwivIkwGc99NuvUQSS0Ku9lBKZv22ti61zSQP/o31FFZwyLnBN6d3MS0QYSTqbU5Dh8tGa3B1k8kCMBWUxSRkZlC7qyMg9KlgKibsntL4h/LtCZhzShdLr8lg5oZ7hT8d59LcvXZq5DQbJfNAWxzyaiMav5md3WFw/COnUfClnhouAUKmmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 07:53:51 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::b00e:ac74:158e:1c7e]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::b00e:ac74:158e:1c7e%4]) with mapi id 15.20.6178.026; Fri, 17 Mar 2023
 07:53:51 +0000
Date: Fri, 17 Mar 2023 15:29:12 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 14/27] KVM: x86: Reject memslot MOVE operations if
 KVMGT is attached
Message-ID: <ZBQWyPF7Py2RTGAH@yzhao56-desk.sh.intel.com>
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-15-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230311002258.852397-15-seanjc@google.com>
X-ClientProxiedBy: SG2PR03CA0132.apcprd03.prod.outlook.com
 (2603:1096:4:91::36) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c44817e-66c8-4c2a-18e4-08db26bcbf70
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdhVWNJ4bm3IiYqabEn6jAWH3j2+HXRZC8+EbMxEqQ4L9JfE1LtA1Rymp69ygOrX/kLWysmywDU2lIM4FE+xEoyVP4qge1/EHlaWw2/k1nsvk5V1rtNAWHXmuhjt7wPDhWrx7L0bsQvl6sjOCtjptXiZwopmaU2x33rc4cwBMy9EPfZ+21t26J8YyqrezEOCe0j8HCo0lmMgoHMIChhGcvEm4NFkX8aC2nh1Q4EzMndDd05trI/7wFghEAYQ/f6iWB53w1B44DVpwi3FLiTEzweY7yKoFix9Nd7TCwc1/YgO7nShAforR7drFgl2pLRrjzmNNoGGxAN+lf6LlQHfQcjDZx5aKmf3uQL2ju1Rb3XSbtUo6KPEK/lm2vJs9VkGWneKyYLzb45B+S6lXFHcyg0L0l0aP6mR1EyN/dq34jTHqcbU/EZ27Ud7AZ8+jrGyVBNBWYLPVw+sw2T5DPvBI7Ohqp6s4SSRmjoNnTW5jqn7GMJtzmg1kbzJlgL3r6PlvpmED+MWoRN6AT4Ixn/GrhXVZYbjmY/Ws8/QS0gWpHB/SLvs3LY1kRKQBlw+QEfhmdOc2PKRiJxFOrHY8bp0ugJHKk58mt/FOapkDPY5hj+L66jAoqYUGGXzLU8PBjOSAlMjWzkRIltY392W/fjkig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199018)(186003)(6486002)(478600001)(6666004)(54906003)(6512007)(6506007)(26005)(316002)(8676002)(6916009)(66946007)(66476007)(4326008)(41300700001)(66556008)(8936002)(2906002)(3450700001)(5660300002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9pY2aUutJ7pq0Vt5v5kEcRiUUJSCoBTw+dBmrEUlJ2woQzc2lU/9KnkHEOKk?=
 =?us-ascii?Q?Lf4Ot80A1HzYxRZxzXRzYx5ZYmITAgemaDGwzABzoRw1MTwAXIJFUBsGGmho?=
 =?us-ascii?Q?MFD4UfBfVrtjoqoMK0zu3wyN49nMzz7Apyvwr18OKWXitcUUtgbKNldYjW7h?=
 =?us-ascii?Q?zhuPdXqjhYgYDhGn+oKnYdki2WmernGkPDv8W7AfR11oNJcPEXqtv5KTmeab?=
 =?us-ascii?Q?FanCB5FRATQPY2vF7Pbs0CWcAJdTRDieELnyGSvwLlwiNT+cYIE70tHD24Bq?=
 =?us-ascii?Q?JB7xnwmLrgLKPgFmn6A55XoV1P/zefzlupHoY6GnhGZrBRJjaT75/ZyZIO7a?=
 =?us-ascii?Q?yR4zZfKQxZD1EDw/KttXKq2A0WDow9UVNGkwvmFxGefa4RgLUHF0R2l+3YX4?=
 =?us-ascii?Q?AkaTq6qURRbALK6oh47ut6uryeQSw4aD4cR+e1DGAQ6ikHtTgJveLNvzMr2v?=
 =?us-ascii?Q?/PhTuETtad4wj0qyHrXAHYKCqcnL6n3oHo2cslvkRnOG5eMlSTcjvR8t/l87?=
 =?us-ascii?Q?lj89IlrqWVdPfdwxz22SwHXnBq1W3bfsRsTkJ/BZw1LVEYRUdsvTQBo5cGLe?=
 =?us-ascii?Q?3IUhc/I/Gi+aolBN2pjsgNR+hZ5ZNvkzLg55IkRAAdlaxv08IHll8sho1O9U?=
 =?us-ascii?Q?n5eOTKeTf4i2sWlallQ+RUy1tOpB4Q4ewoT/7SU7z804u854QlINoyzQzQDb?=
 =?us-ascii?Q?Q/jlTXl3aWSholh30L24CSmksE/ozJYgx6YpOhijNXHHJwDzr2UTI1JFuFCp?=
 =?us-ascii?Q?Pncl2TYkdw21vMERsnYjdYxn2BwT9/wMi+Rv9/o9tv1pZVK+D7qTek+HTzAu?=
 =?us-ascii?Q?YykLM5RL/o7aBRCyIh/cZGbS79MLZ4bJz5kZWoZysyx8EiN4Dv8ZGREOKN3K?=
 =?us-ascii?Q?RB068y8McvVjBCWmURELBMOsNPnmc8sS2AHliVN89zV+N9nIQBVKrzIuFq3m?=
 =?us-ascii?Q?jjUYKWtF7ix9lHbIdWXOhu8UcMuMRqgvgIxDvvCgnnfiaWvf+lNny4eifxL5?=
 =?us-ascii?Q?bNLPJohSjdMoA7E8aVfkjdZdQH0wCvfuV532wTxfmtpC3Rvp7YbBssrOnkLn?=
 =?us-ascii?Q?ZF3YL9FvSxSLYrfYaE98aQY7LGxJmIOJlN8UF508fEp5nzE0atJNRVPZsQmf?=
 =?us-ascii?Q?4nGg+iKoqm0fO6KjYg/g7msciUy/bB/wV9vuUffSiJmro+77p5adyI7/QIdo?=
 =?us-ascii?Q?h8ACwyFpMgny+960H6FolqMeTxPsL7qCxwm/fwoV/5u8vpKcO4QCm9AnYQ47?=
 =?us-ascii?Q?VJeB/ykfj3haTAynH7aUht3Dc1jsVx7ylEWhKHCzTeceKtP2cEhRvhinZFpS?=
 =?us-ascii?Q?pZtRIEoge6r3dwQXm3NZzPsrfIScHsyKvtG+WLYwwOhs3AhzQEOq7LI3PT1U?=
 =?us-ascii?Q?mGSG65Ms4zLajz7Wa4jmcXTFizz6nKWKXPJqYCiPsfvWif8rg200qcdCyQ/z?=
 =?us-ascii?Q?vErhAlLKj/ZWW0gjizpJsAAZhGd61+LnW2p3+A8KjgrdsYLP64abhUw0j8Ax?=
 =?us-ascii?Q?YNVJYfat6JU79Giy2H+FCQnev8ZHUR3nQRKy98so5Nntpv+cLKgQiEEwQeVX?=
 =?us-ascii?Q?2/MkIQDanXNlFsU3yWyMXoPiVannmeo5VXLfBSptYFrX+00hLCmte88zpXTq?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c44817e-66c8-4c2a-18e4-08db26bcbf70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 07:53:51.2256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkKcjR6MynEBL7JwcCKOL9M+tIhxv4e4vJAQpsFqJd6sNXoGJ4lQiM86IlZ0PttJ+u+g3PUkOSw/MRUNDbqg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
X-OriginatorOrg: intel.com
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>

On Fri, Mar 10, 2023 at 04:22:45PM -0800, Sean Christopherson wrote:
> Disallow moving memslots if the VM has external page-track users, i.e. if
> KVMGT is being used to expose a virtual GPU to the guest, as KVM doesn't
> correctly handle moving memory regions.
> 
> Note, this is potential ABI breakage!  E.g. userspace could move regions
> that aren't shadowed by KVMGT without harming the guest.  However, the
> only known user of KVMGT is QEMU, and QEMU doesn't move generic memory
> regions.  KVM's own support for moving memory regions was also broken for
> multiple years (albeit for an edge case, but arguably moving RAM is
> itself an edge case), e.g. see commit edd4fa37baa6 ("KVM: x86: Allocate
> new rmap and large page tracking when moving memslot").
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_page_track.h | 3 +++
>  arch/x86/kvm/mmu/page_track.c         | 5 +++++
>  arch/x86/kvm/x86.c                    | 7 +++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
> index 0d65ae203fd6..6a287bcbe8a9 100644
> --- a/arch/x86/include/asm/kvm_page_track.h
> +++ b/arch/x86/include/asm/kvm_page_track.h
> @@ -77,4 +77,7 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
>  void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
>  			  int bytes);
>  void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
> +
> +bool kvm_page_track_has_external_user(struct kvm *kvm);
> +
>  #endif
> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> index 39a0863af8b4..1cfc0a0ccc23 100644
> --- a/arch/x86/kvm/mmu/page_track.c
> +++ b/arch/x86/kvm/mmu/page_track.c
> @@ -321,3 +321,8 @@ enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
>  	return max_level;
>  }
>  EXPORT_SYMBOL_GPL(kvm_page_track_max_mapping_level);
> +
> +bool kvm_page_track_has_external_user(struct kvm *kvm)
> +{
> +	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
> +}
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 29dd6c97d145..47ac9291cd43 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12484,6 +12484,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				   struct kvm_memory_slot *new,
>  				   enum kvm_mr_change change)
>  {
> +	/*
> +	 * KVM doesn't support moving memslots when there are external page
> +	 * trackers attached to the VM, i.e. if KVMGT is in use.
> +	 */
> +	if (change == KVM_MR_MOVE && kvm_page_track_has_external_user(kvm))
> +		return -EINVAL;
> +
>  	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE) {
>  		if ((new->base_gfn + new->npages - 1) > kvm_mmu_max_gfn())
>  			return -EINVAL;
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 
